using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Threading.Tasks;
using RESTAPI.Data;

namespace RESTAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PeopleController : ControllerBase
    {
        private readonly PeopleDbContext _context;
        public PeopleController(PeopleDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<List<Person>>> Get()
        {
            return await _context.People.ToListAsync(); ;
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Person>> GetById(int id)
        { 
            var person = await _context.People.FindAsync(id);

            if(person == null)
                return NotFound();

            return person;
        }

        [HttpPost]
        public async Task<ActionResult<Person>> Create(Person person)
        {
            var newPerson = new Person
            {
                Name = person.Name,
                Age = person.Age,
            };

            _context.People.Add(newPerson);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetById), new { id = newPerson.Id }, newPerson);
        }


        [HttpPut("{id}")]
        public async Task<ActionResult> Update(int id, Person person)
        {
            if (id != person.Id)
            {
                return BadRequest();
            }

            _context.Entry(person).State = EntityState.Modified;

            await _context.SaveChangesAsync();

            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var person = await _context.People.FindAsync(id);

            if (person == null)
            {
                return NotFound();
            }

            _context.People.Remove(person);
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}
