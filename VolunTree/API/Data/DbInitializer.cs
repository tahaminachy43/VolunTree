using System.Threading.Tasks;
using API.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

namespace API.Data
{
    public static class DbInitializer
    {
        public static async Task Initialize(VoluntreeContext context, UserManager<User> userManager)
        {
            // Seed regular user, Jasom, and org user, GetosLAB:
            if (!userManager.Users.Any())
            {
                var user = new User
                {
                    UserName = "Jason",
                    Email = "jason@gmail.com"
                };

                var result1 = await userManager.CreateAsync(user, "Pa$$word123!");
                if (result1.Succeeded)
                {
                    await userManager.AddToRoleAsync(user, "RegularUser");
                }
                else
                {
                    throw new Exception("Failed to create Jason: " + string.Join(", ", result1.Errors.Select(e => e.Description)));
                }

                var org = new User
                {
                    UserName = "GetosLAB",
                    Email = "geto@gmail.com",
                    Description = "We recruit high school and university students for our volunteering programs!"
                };

                var result2 = await userManager.CreateAsync(org, "Pa$$word123!");
                if (result2.Succeeded)
                {
                    await userManager.AddToRoleAsync(org, "Org");
                }
                else
                {
                    throw new Exception("Failed to create Geto: " + string.Join(", ", result2.Errors.Select(e => e.Description)));
                }
            }

            // Retrieve GetosLAB reference:
            var getosLab = await userManager.FindByEmailAsync("geto@gmail.com");
            if (getosLab == null)
                throw new Exception("Organization user GetosLAB not found in the database.");


            // Seed Challenges:
            if (!context.Challenges.Any())
            {
                var challenges = new List<Challenge>
                {
                    new() {
                        Name = "Bronze",
                        Description = "Volunteer for 10 hours"
                    },

                    new() {
                        Name = "Silver",
                        Description = "Volunteer for 50 hours"
                    },

                    new() {
                        Name = "Gold",
                        Description = "Volunteer for 100 hours"
                    },

                    new() {
                        Name = "Sav's Community Challenge",
                        Description = "Volunteer at 5 places with the community tag"
                    }
                };

                foreach (var challenge in challenges)
                {
                    context.Challenges.Add(challenge);
                }
                context.SaveChanges();
            }

            // Seed Volunteering types:
            if (!context.VolunteeringTypes.Any())
            {
                var types = new List<VolunteeringType>
                {
                    new() {
                        Name = "University Research"
                    },
                    new() {
                        Name = "High School"
                    },
                    new() {
                        Name = "Healthcare"
                    },
                    new() {
                        Name = "Environmental"
                    },
                    new() {
                        Name = "Community"
                    },

                };

                foreach (var type in types)
                {
                    context.VolunteeringTypes.Add(type);
                }
                context.SaveChanges();
            }

            // Retrieve type references:
            var allTypes = await context.VolunteeringTypes.ToListAsync();

            VolunteeringType FindType(string name) =>
                allTypes.First(t => t.Name.Equals(name, StringComparison.OrdinalIgnoreCase));


            // Seed Volunteering opportunities:
            if (!context.VolunteeringOpportunities.Any())
            {
                var opportunities = new List<VolunteeringOpportunity>
                {
                    new() {
                        Name = "Computer Science Outreach",
                        Description = "We're searching for students who would like to teach middle schoolers the basics of programming!",
                        Address = "1301 10 Ave SW, Calgary, AB T3C 0J4",
                        OrgId = getosLab.Id,
                        TypePreferences =
                        [
                            FindType("Community"),
                            FindType("High School")
                        ]
                    },
                    new() {
                        Name = "Cursed Energy Research",
                        Description = "We need university students who want to research cursed energy in humans. This is for summer 2025. Please apply by April 24th.",
                        Address = "1033 17 Ave SW, Calgary, AB T2T 0A9",
                        OrgId = getosLab.Id,
                        TypePreferences =
                        [
                            FindType("University Research"),
                            FindType("Environmental")
                        ]
                    },
                    new() {
                        Name = "Animal Testing",
                        Description = "We want to bring extinct animals back to life! Please apply asap as positions are limited.",
                        Address = "1058 17 ave sw, Calgary, ab t2t 0a5",
                        OrgId = getosLab.Id,
                        TypePreferences =
                        [
                            FindType("High School"),
                            FindType("University Research"),
                            FindType("Community")
                        ]
                    }
                };

                context.VolunteeringOpportunities.AddRange(opportunities);
                await context.SaveChangesAsync();
            }
            
            // Seed ApplicationToJoinVolOpp: 
            if (!context.ApplicationsToJoin.Any())
            {
                var firstOpp = await context.VolunteeringOpportunities.FirstAsync();
                var jason = await userManager.FindByEmailAsync("jason@gmail.com");

                var application = new ApplicationToJoinVolOpp
                {
                    OpportunityId = firstOpp.Id,
                    UserId = jason.Id,
                    Status = "pending",
                    SupplementaryMessage = "LET ME JOIN PLEASE!"
                };

                context.ApplicationsToJoin.Add(application);
                await context.SaveChangesAsync();
            }

        }
    }
}