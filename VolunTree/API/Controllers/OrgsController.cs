using API.Data;
using API.DTOs.Org;
using API.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API.Controllers
{
    [Authorize(Roles = "Org")]
    public class OrgsController : BaseApiController
    {
        private readonly VoluntreeContext _context;
        private readonly UserManager<User> _userManager;

        public OrgsController(VoluntreeContext context, UserManager<User> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        // 1. List of volunteers requesting to join this org's posted voluntering opportunties (Card has opporunity name + username):
        [HttpGet("applications")]
        public async Task<ActionResult<IEnumerable<ApplicationRequestingToJoinDto>>> GetApplicationsForOrg()
        {
            var org = await _userManager.FindByEmailAsync(User.Identity!.Name!);

            if (org == null)
                return Unauthorized("Organization not found.");

            var applications = await _context.ApplicationsToJoin
                .Include(a => a.Opportunity)
                .Include(a => a.User)
                .Where(a => a.Opportunity.OrgId == org.Id)
                .Select(a => new ApplicationRequestingToJoinDto
                {
                    Id = a.Id,
                    OpportunityName = a.Opportunity.Name,
                    VolunteerUsername = a.User.UserName
                })
                .ToListAsync();

            return Ok(applications);
        }

        // 2. Profile page which has name of org, description, a list of volunteering opportunities
        [HttpGet("profile")]
        public async Task<ActionResult<ProfileDto>> GetOrgHome()
        {
            var org = await _userManager.FindByEmailAsync(User.Identity!.Name!);

            if (org == null)
                return Unauthorized("Organization not found.");

            var opportunities = await _context.VolunteeringOpportunities
                .Where(o => o.OrgId == org.Id)
                .Select(o => new ProfileVolunteeringDto
                {
                    Id = o.Id,
                    Name = o.Name,
                })
                .ToListAsync();

            var response = new ProfileDto
            {
                OrgName = org.UserName,
                Description = org.Description,
                Opportunities = opportunities
            };

            return Ok(response);
        }


        // 3. Org edits their profile description:
        [HttpPut("profile/description")]
        public async Task<ActionResult> UpdateDescription([FromBody] string newDescription)
        {
            var org = await _userManager.FindByEmailAsync(User.Identity!.Name!);

            if (org == null)
                return Unauthorized("Organization not found.");

            org.Description = newDescription;

            var result = await _userManager.UpdateAsync(org);
            if (!result.Succeeded)
            {
                return BadRequest("Failed to update description: " +
                    string.Join(", ", result.Errors.Select(e => e.Description)));
            }

            return Ok(new { message = "Description updated." });
        }

        // 4. Org adds opportunity: name, list of eligible volunteering types, description, address: 
        [HttpPost("add-opportunity")]
        public async Task<ActionResult> AddOpportunity([FromBody] AddOpportunityDto dto)
        {
            var org = await _userManager.FindByEmailAsync(User.Identity!.Name!);

            if (org == null)
                return Unauthorized("Organization not found.");

            // Map type names (strings) to actual entities:
            var volunteeringTypes = await _context.VolunteeringTypes
                .Where(t => dto.VolunteeringTypeNames.Contains(t.Name))
                .ToListAsync();

            var opportunity = new VolunteeringOpportunity
            {
                Name = dto.Name,
                Description = dto.Description,
                Address = dto.Address,
                OrgId = org.Id,
                TypePreferences = volunteeringTypes
            };

            _context.VolunteeringOpportunities.Add(opportunity);
            await _context.SaveChangesAsync();

            return Ok(new { message = "Opportunity added successfully." });
        }

    }
}
