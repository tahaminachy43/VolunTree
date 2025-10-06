using API.Data;
using API.DTOs;
using API.DTOs.User;
using API.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API.Controllers
{
    [Authorize]
    public class UsersController : BaseApiController
    {
        private readonly VoluntreeContext _context;
        public UsersController(VoluntreeContext context)
        {
            _context = context;
        }

        [HttpGet("types")]
        public async Task<ActionResult<List<VolunteeringTypeDto>>> GetTypes()
        {
            return await _context.VolunteeringTypes
                .Select(t => new VolunteeringTypeDto
                {
                    Id = t.Id,
                    Name = t.Name
                })
                .ToListAsync();

        }

        [HttpGet("challenges")]
        public async Task<ActionResult<List<Challenge>>> GetChallenges()
        {
            return await _context.Challenges.ToListAsync();
        }

        // 1. When registering: receive types from user and their hours goal:
        [HttpPost("register-preferences")]
        public async Task<ActionResult> SetUserPreferences([FromBody] UserPreferencesDto dto)
        {
            var userId = User.Identity!.Name;           // Name claim is Email
            if (userId == null) return Unauthorized();

            var user = await _context.Users
                .Include(u => u.TypePreferences)
                .FirstOrDefaultAsync(u => u.Email == userId);

            if (user == null) return Unauthorized();

            // Fetch selected VolunteeringType entities:
            var selectedTypes = await _context.VolunteeringTypes
                .Where(t => dto.TypeIds.Contains(t.Id))
                .ToListAsync();

            // Set new preferences:
            user.TypePreferences.Clear();
            foreach (var type in selectedTypes)
                user.TypePreferences.Add(type);

            user.HoursGoal = dto.HoursGoal;

            await _context.SaveChangesAsync();
            return Ok(new { message = "Preferences updated successfully." });
        }

        // 2. Get list of volunteering opportunities on home screen:
        [HttpGet("home-opportunities")]
        public async Task<ActionResult<List<HomeVolunteeringDto>>> GetOpportunities()
        {
            var opportunities = await _context.VolunteeringOpportunities
                .Include(o => o.TypePreferences)
                .Take(10)                               // Limit to 10
                .Select(o => new HomeVolunteeringDto
                {
                    Id = o.Id,
                    Name = o.Name,
                    Description = o.Description,
                    VolunteeringTypes = o.TypePreferences.Select(t => t.Name).ToList()
                })
                .ToListAsync();

            return Ok(opportunities);
        }

    }
}