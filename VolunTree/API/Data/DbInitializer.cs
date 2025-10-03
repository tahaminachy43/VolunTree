using System.Threading.Tasks;
using API.Entities;
using Microsoft.AspNetCore.Identity;

namespace API.Data
{
    public static class DbInitializer
    {
        public static async Task Initialize(VoluntreeContext context, UserManager<User> userManager)
        {
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
            
            if (!context.Challenges.Any())
                {
                    var challenges = new List<Challenge>
                {
                    new Challenge
                    {
                        Name = "Bronze",
                        Description = "Volunteer for 10 hours"
                    },

                    new Challenge
                    {
                        Name = "Silver",
                        Description = "Volunteer for 50 hours"
                    },

                    new Challenge
                    {
                        Name = "Gold",
                        Description = "Volunteer for 100 hours"
                    },

                    new Challenge
                    {
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

            if (!context.VolunteeringTypes.Any())
            {
                var types = new List<VolunteeringType>
                {
                    new VolunteeringType
                    {
                        Name = "University Research"
                    },
                    new VolunteeringType
                    {
                        Name = "High School"
                    },
                    new VolunteeringType
                    {
                        Name = "Healthcare"
                    },
                    new VolunteeringType
                    {
                        Name = "Environmental"
                    },
                    new VolunteeringType
                    {
                        Name = "Community"
                    },

                };

                foreach (var type in types)
                {
                    context.VolunteeringTypes.Add(type);
                }
                context.SaveChanges();
            }
        }
    }
}