using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API.DTOs.Org
{
    public class AddOpportunityDto
    {
        public string Name { get; set; } = string.Empty;                    
        public string Description { get; set; } = string.Empty;              
        public string Address { get; set; } = string.Empty;                  
        public List<string> VolunteeringTypeNames { get; set; } = [];     // Names of volunteering types to link to entities in database
    }
}