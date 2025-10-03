using API.Data;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    public class OrgsController : BaseApiController
    {
        private readonly VoluntreeContext _context;
        public OrgsController(VoluntreeContext context)
        {
            _context = context;
        }
    }
}