using API.Data;
using API.DTOs;
using API.Entities;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API.Controllers
{
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

        // Endpoints to create currently:

        // 1. When registering: receive types from user and their hours goal. Set on their profile.
        // 2. Get list of volunteering opportunities on main screen

    }
}