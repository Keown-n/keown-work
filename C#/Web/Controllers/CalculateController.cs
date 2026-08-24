using Microsoft.AspNetCore.Mvc;
using Domain;


namespace Web.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class CalculateController : ControllerBase
    {

        [HttpGet("Add/{x}/{y}")]
        public int Get(int x, int y)
        {
            return new Calculator().Sum(x, y);
        }
    }
}
