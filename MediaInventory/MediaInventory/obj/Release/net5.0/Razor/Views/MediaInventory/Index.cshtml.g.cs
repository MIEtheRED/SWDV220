#pragma checksum "C:\Users\bmiethe\Documents\GitHub\SWDV-235-Project-2\MediaInventory\MediaInventory\Views\MediaInventory\Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "c5a80267c500fceddf44690f95ba3a567348dfde"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_MediaInventory_Index), @"mvc.1.0.view", @"/Views/MediaInventory/Index.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "C:\Users\bmiethe\Documents\GitHub\SWDV-235-Project-2\MediaInventory\MediaInventory\Views\_ViewImports.cshtml"
using MediaInventory;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "C:\Users\bmiethe\Documents\GitHub\SWDV-235-Project-2\MediaInventory\MediaInventory\Views\_ViewImports.cshtml"
using MediaInventory.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"c5a80267c500fceddf44690f95ba3a567348dfde", @"/Views/MediaInventory/Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"c4478b45dc217752da43579c2c51299515a2e2f6", @"/Views/_ViewImports.cshtml")]
    public class Views_MediaInventory_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<List<MediaInventory>>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 2 "C:\Users\bmiethe\Documents\GitHub\SWDV-235-Project-2\MediaInventory\MediaInventory\Views\MediaInventory\Index.cshtml"
  
    ViewData["Title"] = "Artist Page";

#line default
#line hidden
#nullable disable
            WriteLiteral(@"
<div>
    <h1>Artists</h1>
</div>
<div>
    <table class=""table table-bordered table-striped"">
        <thead>
            <tr><th>Media ID</th><th>Format</th><th>Media Name</th><th>Genre</th><th>Release Date</th><th>Quantity</th><th>Status</th></tr>
        </thead>
        <tbody>
");
#nullable restore
#line 15 "C:\Users\bmiethe\Documents\GitHub\SWDV-235-Project-2\MediaInventory\MediaInventory\Views\MediaInventory\Index.cshtml"
             foreach (var MediaInventory in Model)
            {

#line default
#line hidden
#nullable disable
            WriteLiteral("            <tr>\r\n                <td>");
#nullable restore
#line 18 "C:\Users\bmiethe\Documents\GitHub\SWDV-235-Project-2\MediaInventory\MediaInventory\Views\MediaInventory\Index.cshtml"
               Write(MediaInventory.MediaId);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                <td>");
#nullable restore
#line 19 "C:\Users\bmiethe\Documents\GitHub\SWDV-235-Project-2\MediaInventory\MediaInventory\Views\MediaInventory\Index.cshtml"
               Write(MediaInventory.MediaFormat);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                <td>");
#nullable restore
#line 20 "C:\Users\bmiethe\Documents\GitHub\SWDV-235-Project-2\MediaInventory\MediaInventory\Views\MediaInventory\Index.cshtml"
               Write(MediaInventory.MediaName);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                <td>");
#nullable restore
#line 21 "C:\Users\bmiethe\Documents\GitHub\SWDV-235-Project-2\MediaInventory\MediaInventory\Views\MediaInventory\Index.cshtml"
               Write(MediaInventory.MediaGenre);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                <td>");
#nullable restore
#line 22 "C:\Users\bmiethe\Documents\GitHub\SWDV-235-Project-2\MediaInventory\MediaInventory\Views\MediaInventory\Index.cshtml"
               Write(MediaInventory.MediaReleaseDate);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                <td>");
#nullable restore
#line 23 "C:\Users\bmiethe\Documents\GitHub\SWDV-235-Project-2\MediaInventory\MediaInventory\Views\MediaInventory\Index.cshtml"
               Write(MediaInventory.MediaQty);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                <td>");
#nullable restore
#line 24 "C:\Users\bmiethe\Documents\GitHub\SWDV-235-Project-2\MediaInventory\MediaInventory\Views\MediaInventory\Index.cshtml"
               Write(MediaInventory.MediaStatus);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n            </tr>\r\n");
#nullable restore
#line 26 "C:\Users\bmiethe\Documents\GitHub\SWDV-235-Project-2\MediaInventory\MediaInventory\Views\MediaInventory\Index.cshtml"
            }

#line default
#line hidden
#nullable disable
            WriteLiteral("        </tbody>\r\n    </table>\r\n</div>\r\n");
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<List<MediaInventory>> Html { get; private set; }
    }
}
#pragma warning restore 1591
