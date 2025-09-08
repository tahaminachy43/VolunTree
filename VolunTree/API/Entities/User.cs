namespace API.Entities
{
    public class User
    {
        public int Id { get; set; }
        public string FullName { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public int HoursGoal { get; set; }
        public string PfpURL { get; set; } = string.Empty;
        
        public ICollection<ApplicationToJoinVolOpp> Applications { get; set; } = new List<ApplicationToJoinVolOpp>(); // A user can have many applications
        public ICollection<VolunteeringType> TypePreferences { get; set; } = new List<VolunteeringType>();            // A user can have many type preferences
    }
}