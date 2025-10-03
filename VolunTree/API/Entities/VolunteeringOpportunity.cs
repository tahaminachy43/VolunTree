namespace API.Entities
{
    public class VolunteeringOpportunity
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public string Address { get; set; } = string.Empty;

        // Foreign key to the org user
        public string OrgId { get; set; }
        public User Org { get; set; } = null!;

         // A user can have many type preferences
        public ICollection<VolunteeringType> TypePreferences { get; set; } = new List<VolunteeringType>();          
        
    }
}