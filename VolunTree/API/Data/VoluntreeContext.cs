using API.Entities;
using Microsoft.EntityFrameworkCore;

namespace API.Data
{
    public class VoluntreeContext : DbContext
    {
        public VoluntreeContext(DbContextOptions options) : base(options)
        {

        }

        public DbSet<ApplicationToJoinVolOpp> ApplicationsToJoin{ get; set; }
        public DbSet<Challenge> Challenges { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<VolunteeringOpportunity> VolunteeringOpportunities { get; set; }
        public DbSet<VolunteeringType> VolunteeringTypes { get; set; }

    }
}