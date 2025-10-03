using Microsoft.AspNetCore.Identity;

namespace API.Entities
{
    public class User : IdentityUser
    {
        public string Description { get; set; } = string.Empty;
        public int HoursGoal { get; set; } = 0;
        public string PfpURL { get; set; } = string.Empty;
        
        public ICollection<ApplicationToJoinVolOpp> Applications { get; set; } = new List<ApplicationToJoinVolOpp>(); // A user can have many applications
        public ICollection<VolunteeringType> TypePreferences { get; set; } = new List<VolunteeringType>();            // A user can have many type preferences
    }
}