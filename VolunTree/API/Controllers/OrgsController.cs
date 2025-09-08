using API.Data;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class OrgsController : ControllerBase
    {
        private readonly VoluntreeContext _context;
        public OrgsController(VoluntreeContext context)
        {
            _context = context;
        }
    }
}