using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace API.Data.Migrations
{
    /// <inheritdoc />
    public partial class SeedRolesUpdate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "5373de78-e2da-48ff-b875-74559cfa7e84");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "5915d628-aef7-4a74-9050-87711f32aecd");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "9dad3a7c-c11c-4569-8250-37dba248c656");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { "47bc5470-0843-4c63-b525-43c4b891f3b9", null, "RegularUser", "REGULARUSER" },
                    { "5f9d3e98-8f08-4966-91dd-9717add71829", null, "Admin", "ADMIN" },
                    { "8f49b43d-e9f1-4dd4-9751-075ac2373894", null, "Org", "ORG" }
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "47bc5470-0843-4c63-b525-43c4b891f3b9");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "5f9d3e98-8f08-4966-91dd-9717add71829");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "8f49b43d-e9f1-4dd4-9751-075ac2373894");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { "5373de78-e2da-48ff-b875-74559cfa7e84", null, "Org", "ORG" },
                    { "5915d628-aef7-4a74-9050-87711f32aecd", null, "RegularUser", "REGULARUSER" },
                    { "9dad3a7c-c11c-4569-8250-37dba248c656", null, "Admin", "ADMIN" }
                });
        }
    }
}
