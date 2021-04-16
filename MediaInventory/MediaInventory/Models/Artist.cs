using System;
using System.Collections.Generic;

#nullable disable

namespace MediaInventory.Models
{
    public partial class Artist
    {
        public Artist()
        {
            MediaTypes = new HashSet<MediaType>();
        }

        public int ArtistId { get; set; }
        public string ArtistName { get; set; }
        public string BandName { get; set; }
        public string Definition { get; set; }

        public virtual ICollection<MediaType> MediaTypes { get; set; }
    }
}
