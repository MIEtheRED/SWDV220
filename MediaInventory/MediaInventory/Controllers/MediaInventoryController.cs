using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MediaInventory.Models;

namespace MediaInventory.Controllers
{
    public class MediaInventoryController : Controller
    {
        private disk_inventorybmContext context { get; set; }         // Student context name will differ
        public MediaInventoryController(disk_inventorybmContext ctx)            // Student context name will differ
        {
            context = ctx;
        }
        public IActionResult Index()
        {
            var media = context.MediaInventories.OrderBy(a => a.MediaName).ToList();
            return View(media);
        }
    }
}