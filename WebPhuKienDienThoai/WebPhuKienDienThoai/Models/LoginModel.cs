using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace DemoBackend.Models
{
    public class LoginModel
    {

        [Required(ErrorMessage = "Vui lòng nhập tên khách hàng")]
        [MaxLength(255, ErrorMessage = "Tên khách hàng không được quá 255 ký tự")]
        public string tenkhachhang { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập mật khẩu")]
        public string matkhau { get; set; }

    }
}
