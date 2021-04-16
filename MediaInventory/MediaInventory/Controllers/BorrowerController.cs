using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MediaInventory.Models;

namespace MediaInventory.Controllers
{
    public class BorrowerController : Controller
    {
        private disk_inventorybmContext context { get; set; }         
        public BorrowerController(disk_inventorybmContext ctx)           
        {
            context = ctx;
        }
        public IActionResult Index()
        {
            var borrower = context.Borrowers.OrderBy(a => a.BorrowerName).ToList();
            return View(borrower);
        }
    }
}