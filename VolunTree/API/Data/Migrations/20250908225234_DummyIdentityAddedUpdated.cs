using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace API.Data.Migrations
{
    /// <inheritdoc />
    public partial class DummyIdentityAddedUpdated : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "08ec2be1-d7c4-4fc9-b87e-a9b03c8a7eae");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "8ed02ade-3e06-4a7e-8b88-fcf3de4e09b5");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "95361b44-cd83-4fc6-a6cd-8f66329eb083");

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

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
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
                    { "08ec2be1-d7c4-4fc9-b87e-a9b03c8a7eae", null, "Admin", "ADMIN" },
                    { "8ed02ade-3e06-4a7e-8b88-fcf3de4e09b5", null, "Org", "ORG" },
                    { "95361b44-cd83-4fc6-a6cd-8f66329eb083", null, "RegularUser", "REGULARUSER" }
                });
        }
    }
}
