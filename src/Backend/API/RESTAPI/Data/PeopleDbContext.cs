using Microsoft.EntityFrameworkCore;

namespace RESTAPI.Data
{
    public class PeopleDbContext : DbContext
    {
        public PeopleDbContext(DbContextOptions<PeopleDbContext> options) : base(options)
        { 
            
        }

        public DbSet<Person> People { get; set; }
    }
}
