using API.Entities;

namespace API.Data
{
    public static class DbInitializer
    {
        public static void Initialize(VoluntreeContext context)
        {
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