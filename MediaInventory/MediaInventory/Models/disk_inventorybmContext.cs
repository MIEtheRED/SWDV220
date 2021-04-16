using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace MediaInventory.Models
{
    public partial class disk_inventorybmContext : DbContext
    {
        public disk_inventorybmContext()
        {
        }

        public disk_inventorybmContext(DbContextOptions<disk_inventorybmContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Artist> Artists { get; set; }
        public virtual DbSet<Borrower> Borrowers { get; set; }
        public virtual DbSet<Loan> Loans { get; set; }
        public virtual DbSet<MediaInventory> MediaInventories { get; set; }
        public virtual DbSet<MediaType> MediaTypes { get; set; }
        public virtual DbSet<ViewIndividualArtist> ViewIndividualArtists { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=.\\SQLDEV01;Database=disk_inventorybm;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Artist>(entity =>
            {
                entity.Property(e => e.ArtistId).HasColumnName("Artist_ID");

                entity.Property(e => e.ArtistName)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("Artist_name");

                entity.Property(e => e.BandName)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("Band_name");

                entity.Property(e => e.Definition)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("definition");
            });

            modelBuilder.Entity<Borrower>(entity =>
            {
                entity.Property(e => e.BorrowerId).HasColumnName("Borrower_ID");

                entity.Property(e => e.BorrowerName)
                    .IsRequired()
                    .HasMaxLength(60)
                    .IsUnicode(false)
                    .HasColumnName("Borrower_name");

                entity.Property(e => e.BorrowerPhone)
                    .IsRequired()
                    .HasMaxLength(15)
                    .IsUnicode(false)
                    .HasColumnName("Borrower_phone");

                entity.Property(e => e.Definition)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("definition");
            });

            modelBuilder.Entity<Loan>(entity =>
            {
                entity.Property(e => e.LoanId).HasColumnName("Loan_ID");

                entity.Property(e => e.BorrowerId).HasColumnName("Borrower_ID");

                entity.Property(e => e.Definition)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("definition");

                entity.Property(e => e.LoanInDate)
                    .HasColumnType("date")
                    .HasColumnName("Loan_in_date");

                entity.Property(e => e.LoanOutDate)
                    .HasColumnType("date")
                    .HasColumnName("Loan_out_date");

                entity.Property(e => e.MediaId).HasColumnName("Media_ID");

                entity.HasOne(d => d.Borrower)
                    .WithMany(p => p.Loans)
                    .HasForeignKey(d => d.BorrowerId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Loans__Borrower___276EDEB3");

                entity.HasOne(d => d.Media)
                    .WithMany(p => p.Loans)
                    .HasForeignKey(d => d.MediaId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Loans__Media_ID__286302EC");
            });

            modelBuilder.Entity<MediaInventory>(entity =>
            {
                entity.HasKey(e => e.MediaId)
                    .HasName("PK__Media_In__27D6D41B8E625E94");

                entity.ToTable("Media_Inventory");

                entity.Property(e => e.MediaId).HasColumnName("Media_ID");

                entity.Property(e => e.Definition)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("definition");

                entity.Property(e => e.MediaFormat)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("Media_format");

                entity.Property(e => e.MediaGenre)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("Media_genre")
                    .IsFixedLength(true);

                entity.Property(e => e.MediaName)
                    .IsRequired()
                    .HasMaxLength(60)
                    .IsUnicode(false)
                    .HasColumnName("Media_name");

                entity.Property(e => e.MediaQty).HasColumnName("Media_qty");

                entity.Property(e => e.MediaReleaseDate)
                    .HasColumnType("date")
                    .HasColumnName("Media_release_date");

                entity.Property(e => e.MediaStatus)
                    .IsRequired()
                    .HasMaxLength(60)
                    .IsUnicode(false)
                    .HasColumnName("Media_status")
                    .IsFixedLength(true);
            });

            modelBuilder.Entity<MediaType>(entity =>
            {
                entity.ToTable("Media_Types");

                entity.Property(e => e.MediaTypeId).HasColumnName("Media_type_ID");

                entity.Property(e => e.ArtistId).HasColumnName("Artist_ID");

                entity.Property(e => e.Definition)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("definition");

                entity.Property(e => e.MediaBoxSet)
                    .IsRequired()
                    .HasMaxLength(3)
                    .IsUnicode(false)
                    .HasColumnName("Media_box_set")
                    .IsFixedLength(true);

                entity.Property(e => e.MediaCompilation)
                    .IsRequired()
                    .HasMaxLength(3)
                    .IsUnicode(false)
                    .HasColumnName("Media_compilation")
                    .IsFixedLength(true);

                entity.Property(e => e.MediaId).HasColumnName("Media_ID");

                entity.Property(e => e.MediaMusicVideos)
                    .IsRequired()
                    .HasMaxLength(3)
                    .IsUnicode(false)
                    .HasColumnName("Media_music_videos")
                    .IsFixedLength(true);

                entity.HasOne(d => d.Artist)
                    .WithMany(p => p.MediaTypes)
                    .HasForeignKey(d => d.ArtistId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Media_Typ__Artis__2D27B809");

                entity.HasOne(d => d.Media)
                    .WithMany(p => p.MediaTypes)
                    .HasForeignKey(d => d.MediaId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Media_Typ__Media__2E1BDC42");
            });

            modelBuilder.Entity<ViewIndividualArtist>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("View_Individual_Artists");

                entity.Property(e => e.ArtistFirstName)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("Artist First Name");

                entity.Property(e => e.ArtistId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("Artist_ID");

                entity.Property(e => e.ArtistLastName)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("Artist Last Name");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
