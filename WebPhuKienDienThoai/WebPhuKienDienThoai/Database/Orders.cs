using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebPhuKienDienThoai.Database
{
    public class Orders
    {
        [Key]
        public int id_order { get; set; }
        public string code_cart { get; set; }
        public string tenkhachhang { get; set; }
        public string dienthoai { get; set; }
        public string diachi { get; set; }
        public string tensanpham { get; set; }
        public int soluongmua { get; set; }
        public DateTime ngaydathang { get; set; }
        public string trangthai { get; set; }
    }
}
