using System.ComponentModel.DataAnnotations;

namespace WebPhuKienDienThoai.Models

{
    public class UserAddModel
    {
        [Required(ErrorMessage = "Vui lòng nhập tên khách hàng")]
        [MaxLength(255, ErrorMessage = "Tên khách hàng không được quá 255 ký tự")]
        public string tenkhachhang { get; set; }
        public string email { get; set; }
        public string diachi { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập mật khẩu")]
        public string matkhau { get; set; }
        public string dienthoai { get; set; }
    }
}
