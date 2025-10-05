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

        // Endpoints to create currently: 

        // 1. List of volunteers requesting to join (Card has opporunity name + username)

        // 2. Home page which has name of org, description, a list of volunteering opportunities

        // 3. Org edits their profile description:

        // 4. Org adds opportunity: name, list of eligible volunteering types, description, address: 

    }
}
