namespace API.Entities
{
    public class ApplicationToJoinVolOpp
    {
        public int Id { get; set; }
        public string Status { get; set; } = "pending";  // default
        public string SupplementaryMessage { get; set; } = string.Empty;

        // Foreign Keys
        public int OpportunityId { get; set; }
        public int UserId { get; set; }

        // Navigation Properties
        public VolunteeringOpportunity Opportunity { get; set; } = null!;
        public User User { get; set; } = null!;

    }
}