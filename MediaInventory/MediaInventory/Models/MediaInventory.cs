using System;
using System.Collections.Generic;

#nullable disable

namespace MediaInventory.Models
{
    public partial class MediaInventory
    {
        public MediaInventory()
        {
            Loans = new HashSet<Loan>();
            MediaTypes = new HashSet<MediaType>();
        }

        public int MediaId { get; set; }
        public string MediaFormat { get; set; }
        public string MediaGenre { get; set; }
        public string MediaName { get; set; }
        public byte MediaQty { get; set; }
        public DateTime MediaReleaseDate { get; set; }
        public string MediaStatus { get; set; }
        public string Definition { get; set; }

        public virtual ICollection<Loan> Loans { get; set; }
        public virtual ICollection<MediaType> MediaTypes { get; set; }
    }
}
