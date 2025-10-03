using API.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace API.Data
{
    public class VoluntreeContext : IdentityDbContext<User>
    {
        public VoluntreeContext(DbContextOptions options) : base(options)
        {

        }

        public DbSet<ApplicationToJoinVolOpp> ApplicationsToJoin { get; set; }
        public DbSet<Challenge> Challenges { get; set; }
        public DbSet<VolunteeringOpportunity> VolunteeringOpportunities { get; set; }
        public DbSet<VolunteeringType> VolunteeringTypes { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            builder.Entity<IdentityRole>()
                .HasData(
                    new IdentityRole { Name = "RegularUser", NormalizedName = "REGULARUSER" },
                    new IdentityRole { Name = "Org", NormalizedName = "ORG" },
                    new IdentityRole { Name = "Admin", NormalizedName = "ADMIN" } // In case we want to add an admin portal in the future
                );
        }

    }
}