using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebPhuKienDienThoai.Models
{
    public class OrderAddModel
    {

        [Required(ErrorMessage = "Vui lòng nhập mã cart")]
        public string code_cart { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập tên khách hàng")]
        public string tenkhachhang { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập số điện thoại")]
        public string dienthoai { get; set; }
        public string diachi { get; set; }
        public string tensanpham { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập số lượng mua")]
        public int soluongmua { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập ngày đặt hàng")]
        public DateTime ngaydathang { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập trạng thái")]
        public string trangthai { get; set; }

    }
}