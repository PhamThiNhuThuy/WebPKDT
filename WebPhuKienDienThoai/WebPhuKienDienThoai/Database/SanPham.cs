using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebPhuKienDienThoai.Database
{
    public class SanPham
    {
        [Key]
        public int id_sanpham { get; set; }
        public string tensanpham { get; set; }
        public string masp { get; set; }
        public string giasp { get; set; }
        public int soluong { get; set; }
        public string hinhanh { get; set; }
        public string tomtat { get; set; }
        public int tinhtrang { get; set; }
        public int id_danhmuc { get; set; }
    }
}
