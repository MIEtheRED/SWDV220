using System;
using System.Collections.Generic;

#nullable disable

namespace MediaInventory.Models
{
    public partial class MediaType
    {
        public int MediaTypeId { get; set; }
        public string MediaCompilation { get; set; }
        public string MediaMusicVideos { get; set; }
        public string MediaBoxSet { get; set; }
        public int ArtistId { get; set; }
        public int MediaId { get; set; }
        public string Definition { get; set; }

        public virtual Artist Artist { get; set; }
        public virtual MediaInventory Media { get; set; }
    }
}
