using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebPhuKienDienThoai.Database
{
    public class TrangChu
    {
        [Key]
        public int id_trangchu { get; set; }
        public string tensanpham { get; set; }
        public string masp { get; set; }
        public string giasp { get; set; }
        public int soluong { get; set; }
        public string hinhanh { get; set; }
        public string tomtat { get; set; }
        public int tinhtrang { get; set; }
     
    }
}


