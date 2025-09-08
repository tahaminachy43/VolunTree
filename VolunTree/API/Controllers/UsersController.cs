using API.Data;
using API.DTOs;
using API.Entities;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UsersController : ControllerBase
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
    }
}