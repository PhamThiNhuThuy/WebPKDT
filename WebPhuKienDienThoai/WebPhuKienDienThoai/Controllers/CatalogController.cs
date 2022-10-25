using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebPhuKienDienThoai.Database;
using WebPhuKienDienThoai.Models;

namespace WebPhuKienDienThoai.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CatalogController : ControllerBase
    {
        private readonly DemoDbContext _context;

        public CatalogController(DemoDbContext context)
        {
            _context = context;
        }
        //==== SẢN PHẨM ====
        [Route("sanpham")]
        [HttpGet]
        public async Task<IActionResult> GetSanPham()
        {
            var items = await _context.SanPham.ToListAsync();
            return Ok(items);
        }

        [Route("sanpham-by-danhmuc/{id}")]
        [HttpGet]
        public async Task<ActionResult<SanPham>> GetSanPham(int id)
        {
            var sanPham = await _context.SanPham.FindAsync(id);

            if (sanPham == null)
            {
                return NotFound();
            }

            return sanPham;
        }

        //Thêm sản phẩm
        [Route("add-sanpham")]
        [HttpPost]
        public async Task<ActionResult> AddSanPham([FromBody] SanPhamAddModel model)
        {
            if (ModelState.IsValid)
            {
                var sanpham = new SanPham()
                {
                    tensanpham = model.tensanpham,
                    masp = model.masp,
                    giasp = model.giasp,
                    soluong = model.soluong,
                    hinhanh = model.hinhanh,
                    tomtat = model.tomtat,
                    tinhtrang = model.tinhtrang,
                    id_danhmuc = model.id_danhmuc
                };
                _context.SanPham.Add(sanpham);
                await _context.SaveChangesAsync();
                return Ok(sanpham);
            }
            return BadRequest(ModelState.Values);
        }

        //Sửa sản phẩm
        [HttpPut("update-sanpham/{id}")]
        public async Task<IActionResult> PutSanPham(int id, SanPham sanpham)
        {
            if (id != sanpham.id_sanpham)
            {
                return BadRequest();
            }

            _context.Entry(sanpham).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SanPhamExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }
        // Xóa sản phẩm
        [HttpDelete("delete-sanpham/{id}")]
        public async Task<IActionResult> DeleteSanPham(int id)
        {
            var sanpham = await _context.SanPham.FindAsync(id);
            if (sanpham == null)
            {
                return NotFound();
            }

            _context.SanPham.Remove(sanpham);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool SanPhamExists(int id)
        {
            return _context.SanPham.Any(e => e.id_sanpham == id);
        }

        // GET Products vid CategoryId
        [Route("Id_DanhMuc")]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<SanPham>>> GetProductviaCategoryId([FromQuery] string CategoryId)
        {
            int tmp;
            tmp = int.Parse(CategoryId);
            var data = from p in _context.SanPham
                       where (p.id_danhmuc == tmp)
                       select (p);
            return await data.ToListAsync();
        }

        //==== USERS ====

        [Route("users")]
        [HttpGet]
        public async Task<IActionResult> GetUsers()
        {
            var items = await _context.Users.ToListAsync();
            return Ok(items);
        }

        [Route("user/{id}")]
        [HttpGet]
        public async Task<IActionResult> GetUserId(int id)
        {
            var items = await _context.Users.Where(x => x.id_users == id).ToListAsync();
            return Ok(items);
        }

        //Thêm user
        [Route("add-user-register")]
        [HttpPost]
        public async Task<ActionResult> AddUser([FromBody] RegisterAddModel model)
        {

            if (ModelState.IsValid)
            {
                var user = new User()
                {
                    tenkhachhang = model.tenkhachhang,
                    email = model.email,
                    diachi = model.diachi,
                    dienthoai = model.dienthoai,
                    matkhau = model.matkhau
                };

                _context.Users.Add(user);
                await _context.SaveChangesAsync();

                return Ok(user);
            }

            return BadRequest(ModelState.Values);
        }

        //Thêm user
        [Route("add-user")]
        [HttpPost]
        public async Task<ActionResult> AddUser([FromBody] UserAddModel model)
        {
            if (ModelState.IsValid)
            {
                var user = new User()
                {
                    tenkhachhang = model.tenkhachhang,
                    diachi = model.diachi,
                    dienthoai = model.dienthoai,
                    email = model.email,
                    matkhau = model.matkhau
                };
                _context.Users.Add(user);
                await _context.SaveChangesAsync();
                return Ok(user);
            }
            return BadRequest(ModelState.Values);
        }

        //Sửa user
        [HttpPut("update-user/{id}")]
        public async Task<IActionResult> PutUser(int id, User user)
        {
            if (id != user.id_users)
            {
                return BadRequest();
            }

            _context.Entry(user).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UserExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }
        // Xóa user
        [HttpDelete("delete-user/{id}")]
        public async Task<IActionResult> DeleteUser(int id)
        {
            var user = await _context.Users.FindAsync(id);
            if (user == null)
            {
                return NotFound();
            }

            _context.Users.Remove(user);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool UserExists(int id)
        {
            return _context.Users.Any(e => e.id_users == id);
        }


        //==== CART ====
        [Route("cart")]
        [HttpGet]
        public async Task<IActionResult> GetCart()
        {
            var items = await _context.Cart.ToListAsync();
            return Ok(items);
        }


        //Thêm cart
        [Route("add-cart")]
        [HttpPost]
        public async Task<ActionResult> AddCart([FromBody] CartAddModel model)
        {

            if (ModelState.IsValid)
            {
                var cart = new Cart()
                {
                    tensanpham = model.tensanpham,
                    masp = model.masp,
                    giasp = model.giasp,
                    soluong = model.soluong,
                    hinhanh = model.hinhanh,
                    tomtat = model.tomtat,
                    tinhtrang = model.tinhtrang,
                    id_danhmuc = model.id_danhmuc,
                    tongtien = model.tongtien,
                    tamtinh = model.tamtinh,
                    tongcong = model.tongcong
                };

                _context.Cart.Add(cart);
                await _context.SaveChangesAsync();

                return Ok(cart);
            }

            return BadRequest(ModelState.Values);
        }



        //Sửa cart
        [HttpPut("update-cart/{id}")]
        public async Task<IActionResult> PutCart(int id, Cart cart)
        {
            if (id != cart.id_cart)
            {
                return BadRequest();
            }

            _context.Entry(cart).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CartExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // XÓA cart
        [HttpDelete("delete-cart/{id}")]
        public async Task<IActionResult> DeleteCart(int id)
        {
            var cart = await _context.Cart.FindAsync(id);
            if (cart == null)
            {
                return NotFound();
            }

            _context.Cart.Remove(cart);
            await _context.SaveChangesAsync();

            return NoContent();
        }
        private bool CartExists(int id)
        {
            return _context.Cart.Any(e => e.id_cart == id);
        }


        //==== CART_DETAILS ====
        [Route("cart_details")]
        [HttpGet]
        public async Task<IActionResult> GetCart_Details()
        {
            var items = await _context.Cart_Details.ToListAsync();
            return Ok(items);
        }

        //xóa cart_details
        [HttpDelete("delete-cartdetails/{id}")]
        public async Task<IActionResult> DeleteCart_Details(int id)
        {
            var cart_detail = await _context.Cart_Details.FindAsync(id);
            if (cart_detail == null)
            {
                return NotFound();
            }
            _context.Cart_Details.Remove(cart_detail);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        //Orders
        [Route("orders")]
        [HttpGet]
        public async Task<IActionResult> GetOrders()
        {
            var items = await _context.Orders.ToListAsync();
            return Ok(items);
        }

        //Thêm Orders
        [Route("add-orders")]
        [HttpPost]
        public async Task<ActionResult> AddOrders([FromBody] OrderAddModel model)
        {

            if (ModelState.IsValid)
            {
                var orders = new Orders()
                {
                   code_cart = model.code_cart,
                   tenkhachhang = model.tenkhachhang,
                   dienthoai = model.dienthoai,
                   diachi = model.diachi,
                   tensanpham = model.tensanpham,
                   soluongmua = model.soluongmua,
                   ngaydathang = model.ngaydathang,
                   trangthai = model.trangthai,

                };

                _context.Orders.Add(orders);
                await _context.SaveChangesAsync();

                return Ok(orders);
            }

            return BadRequest(ModelState.Values);
        }

        //Sửa Orders
        [HttpPut("update-orders/{id}")]
        public async Task<IActionResult> PutOrders(int id, Orders orders)
        {
            if (id != orders.id_order)
            {
                return BadRequest();
            }

            _context.Entry(orders).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!OrderExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }
        private bool OrderExists(int id)
        {
            return _context.Orders.Any(e => e.id_order == id);
        }


        //xóa orders
        [HttpDelete("delete-orders/{id}")]
        public async Task<IActionResult> DeleteOrders(int id)
        {
            var orders = await _context.Orders.FindAsync(id);
            if (orders == null)
            {
                return NotFound();
            }
            _context.Orders.Remove(orders);
            await _context.SaveChangesAsync();
            return NoContent();
        }
        IActionResult Ok()
        {
            throw new NotImplementedException();
        }

        //==== ADMIN ====
        [Route("admin")]
        [HttpGet]
        public async Task<IActionResult> GetAdmin()
        {
            var items = await _context.Admin.ToListAsync();
            return Ok(items);
        }

        //==== TRANG CHỦ ====
        [Route("trangchu")]
        [HttpGet]
        public async Task<IActionResult> GetTrangChu()
        {
            var items = await _context.TrangChu.ToListAsync();
            return Ok(items);
        }

        [Route("trangchu-by-danhmuc/{id}")]
        [HttpGet]
        public async Task<IActionResult> GetTrangChuByDanhMuc(int id)
        {
            var items = await _context.TrangChu.Where(x => x.id_trangchu == id).ToListAsync();
            return Ok(items);
        }

        //==== DANH MỤC ====
        [Route("danhmuc")]
        [HttpGet]
        public async Task<IActionResult> GetDanhMuc()
        {
            var items = await _context.DanhMuc.ToListAsync();
            return Ok(items);
        }

        [Route("danhmuc-by-danhmuc/{id}")]
        [HttpGet]
        public async Task<IActionResult> GetDanhMucByDanhMuc(int id)
        {
            var items = await _context.DanhMuc.Where(x => x.id_danhmuc == id).ToListAsync();
            return Ok(items);
        }

        //Thêm danh mục
        [Route("add-danhmuc")]
        [HttpPost]
        public async Task<ActionResult> AddDanhMuc([FromBody] DanhMucAddModel model)
        {

            if (ModelState.IsValid)
            {
                var danhmuc = new DanhMuc()
                {
                    tendanhmuc = model.tendanhmuc
                };

                _context.DanhMuc.Add(danhmuc);
                await _context.SaveChangesAsync();

                return Ok(danhmuc);
            }

            return BadRequest(ModelState.Values);
        }

        

        //Sửa danh mục
        [HttpPut("update-danhmuc/{id}")]
        public async Task<IActionResult> PutDanhMuc(int id, DanhMuc danhMuc)
        {
            if (id != danhMuc.id_danhmuc)
            {
                return BadRequest();
            }

            _context.Entry(danhMuc).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DanhMucExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // XÓA DANH MỤC
        [HttpDelete("delete-danhmuc/{id}")]
        public async Task<IActionResult> DeleteDanhMuc(int id)
        {
            var danhMuc = await _context.DanhMuc.FindAsync(id);
            if (danhMuc == null)
            {
                return NotFound();
            }

            _context.DanhMuc.Remove(danhMuc);
            await _context.SaveChangesAsync();

            return NoContent();
        }
        private bool DanhMucExists(int id)
        {
            return _context.DanhMuc.Any(e => e.id_danhmuc == id);
        }


    }

}
