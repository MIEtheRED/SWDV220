using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MediaInventory.Models;

namespace MediaInventory.Controllers
{
    public class ArtistController : Controller
    {
        private disk_inventorybmContext context { get; set; }

        public ArtistController(disk_inventorybmContext ctx)
        {
            context = ctx;
        }

        public IActionResult Index()
        {
            var artist = context.Artists.ToList();
            return View(artist);
        }
    }
}