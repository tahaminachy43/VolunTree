namespace API.Entities
{
    public class VolunteeringType
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;

        // Allow for reverse navigation:
        public ICollection<User> Users { get; set; } = new List<User>();
        public ICollection<VolunteeringOpportunity> Opportunities { get; set; } = new List<VolunteeringOpportunity>();
    }
}