using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API.DTOs.User
{
    public class UserPreferencesDto
    {
        public List<int> TypeIds { get; set; } = [];     // IDs of the selected volunteering types
        public int HoursGoal { get; set; }               // User's hours goal
    }
}