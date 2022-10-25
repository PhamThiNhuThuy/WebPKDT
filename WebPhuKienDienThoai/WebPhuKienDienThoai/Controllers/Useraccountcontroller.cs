using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using WebPhuKienDienThoai.Models;

namespace WebPhuKienDienThoai.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UseraccountController : ControllerBase
    {
        [Authorize(AuthenticationSchemes = "AuthKey")]
        [Route("index")]
        [HttpGet]
        public IActionResult Index()
        {
            return Ok(new { state = 1 });
        }


        [HttpPost]
        [Route("login")]
        public IActionResult Login([FromBody] LoginUser
            model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            if (model.Username == "Văn Nam" && model.Password == "123")
            {
                string secret = "g2sL6RLQh6dVRSSnCRjvEqP971-V2DGpFoUleIfKrIc";
                string iss = "dcaea177e8d14f1fb863059dde75ca3b";
                string audience = "Demo Backend";
                var signingKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(secret));
                var claims = new List<Claim>()
                {
                    new Claim(ClaimTypes.Name, model.Username),
                    new Claim(ClaimTypes.NameIdentifier, model.Username),
                    new Claim(ClaimTypes.Email,"hoanganh123@gmail.com"),
                    new Claim("FirstName","Hoang "),
                    new Claim("LastName","Nguyen")

                };
                var jwt = new JwtSecurityToken(
                    issuer: iss,
                    audience: audience,
                    claims: claims,
                    notBefore: DateTime.UtcNow,
                    expires: DateTime.UtcNow.AddSeconds(60 * 60),
                    signingCredentials: new SigningCredentials(signingKey, SecurityAlgorithms.HmacSha256)
                    );
                var jwtToken = new JwtSecurityTokenHandler().WriteToken(jwt);
                return Ok(new
                {
                    access_token = jwtToken,
                    expries = DateTime.UtcNow.AddSeconds(60 * 60)
                });

            }
            return BadRequest(new { state = "invalid username or password" });

        }


    }
}