using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebPhuKienDienThoai.Database
{
    public class DemoDbContext : DbContext
    {
        public DemoDbContext(DbContextOptions options)
            : base(options) 
        { }

        public DbSet<Admin> Admin { get; set; }
        public DbSet<Cart> Cart { get; set; }
        public DbSet<Cart_Details> Cart_Details { get; set; }
        public DbSet<DanhMuc> DanhMuc { get; set; }
        public DbSet<SanPham> SanPham { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<TrangChu> TrangChu { get; set; }
        public DbSet<Orders> Orders { get; set; }
    }
}
