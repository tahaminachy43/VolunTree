using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API.DTOs.Org
{
    public class ProfileDto
    {
        public string OrgName { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public List<ProfileVolunteeringDto> Opportunities { get; set; } = new();
    }
}