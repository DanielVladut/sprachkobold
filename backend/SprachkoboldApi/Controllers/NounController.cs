using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace SprachkoboldApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NounController : ControllerBase
    {
        [HttpGet("{baseForm}")]
        public ActionResult<string> Get(string baseForm)
        {
            return Ok(baseForm);
        }

        [HttpGet("{id:int}")]
        public ActionResult<string> Get(int id)
        {
            return Ok(id.ToString());
        }
    }
}