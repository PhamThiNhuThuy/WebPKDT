using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebPhuKienDienThoai.Models
{
    public class RegisterAddModel
    {

        [Required(ErrorMessage = "Vui lòng nhập tên khách hàng")]
        [MaxLength(255, ErrorMessage = "Tên khách hàng không được quá 255 ký tự")]
        public string tenkhachhang { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập email")]
        public string email { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập địa chỉ")]
        [MaxLength(255, ErrorMessage = "Địa chỉ không được quá 255 ký tự")]
        public string diachi { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập số điện thoại")]
        public string dienthoai { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập mật khẩu")]
        public string matkhau { get; set; }
    }
}