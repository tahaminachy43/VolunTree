using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API.DTOs.Org
{
    public class ApplicationRequestingToJoinDto
    {
         public int Id { get; set; }                                    // Application ID
        public string OpportunityName { get; set; } = string.Empty;
        public string VolunteerUsername { get; set; } = string.Empty;
    }
}