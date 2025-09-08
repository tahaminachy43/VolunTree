using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace API.Data.Migrations
{
    /// <inheritdoc />
    public partial class InitialCreate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Challenges",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Name = table.Column<string>(type: "TEXT", nullable: true),
                    Description = table.Column<string>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Challenges", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Users",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    FullName = table.Column<string>(type: "TEXT", nullable: true),
                    Email = table.Column<string>(type: "TEXT", nullable: true),
                    Description = table.Column<string>(type: "TEXT", nullable: true),
                    HoursGoal = table.Column<int>(type: "INTEGER", nullable: false),
                    PfpURL = table.Column<string>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Users", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "VolunteeringTypes",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Name = table.Column<string>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_VolunteeringTypes", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "VolunteeringOpportunities",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Name = table.Column<string>(type: "TEXT", nullable: true),
                    Description = table.Column<string>(type: "TEXT", nullable: true),
                    Address = table.Column<string>(type: "TEXT", nullable: true),
                    OrgId = table.Column<int>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_VolunteeringOpportunities", x => x.Id);
                    table.ForeignKey(
                        name: "FK_VolunteeringOpportunities_Users_OrgId",
                        column: x => x.OrgId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "UserVolunteeringType",
                columns: table => new
                {
                    TypePreferencesId = table.Column<int>(type: "INTEGER", nullable: false),
                    UsersId = table.Column<int>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserVolunteeringType", x => new { x.TypePreferencesId, x.UsersId });
                    table.ForeignKey(
                        name: "FK_UserVolunteeringType_Users_UsersId",
                        column: x => x.UsersId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_UserVolunteeringType_VolunteeringTypes_TypePreferencesId",
                        column: x => x.TypePreferencesId,
                        principalTable: "VolunteeringTypes",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ApplicationsToJoin",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Status = table.Column<string>(type: "TEXT", nullable: true),
                    SupplementaryMessage = table.Column<string>(type: "TEXT", nullable: true),
                    OpportunityId = table.Column<int>(type: "INTEGER", nullable: false),
                    UserId = table.Column<int>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ApplicationsToJoin", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ApplicationsToJoin_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ApplicationsToJoin_VolunteeringOpportunities_OpportunityId",
                        column: x => x.OpportunityId,
                        principalTable: "VolunteeringOpportunities",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "VolunteeringOpportunityVolunteeringType",
                columns: table => new
                {
                    OpportunitiesId = table.Column<int>(type: "INTEGER", nullable: false),
                    TypePreferencesId = table.Column<int>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_VolunteeringOpportunityVolunteeringType", x => new { x.OpportunitiesId, x.TypePreferencesId });
                    table.ForeignKey(
                        name: "FK_VolunteeringOpportunityVolunteeringType_VolunteeringOpportunities_OpportunitiesId",
                        column: x => x.OpportunitiesId,
                        principalTable: "VolunteeringOpportunities",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_VolunteeringOpportunityVolunteeringType_VolunteeringTypes_TypePreferencesId",
                        column: x => x.TypePreferencesId,
                        principalTable: "VolunteeringTypes",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_ApplicationsToJoin_OpportunityId",
                table: "ApplicationsToJoin",
                column: "OpportunityId");

            migrationBuilder.CreateIndex(
                name: "IX_ApplicationsToJoin_UserId",
                table: "ApplicationsToJoin",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_UserVolunteeringType_UsersId",
                table: "UserVolunteeringType",
                column: "UsersId");

            migrationBuilder.CreateIndex(
                name: "IX_VolunteeringOpportunities_OrgId",
                table: "VolunteeringOpportunities",
                column: "OrgId");

            migrationBuilder.CreateIndex(
                name: "IX_VolunteeringOpportunityVolunteeringType_TypePreferencesId",
                table: "VolunteeringOpportunityVolunteeringType",
                column: "TypePreferencesId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ApplicationsToJoin");

            migrationBuilder.DropTable(
                name: "Challenges");

            migrationBuilder.DropTable(
                name: "UserVolunteeringType");

            migrationBuilder.DropTable(
                name: "VolunteeringOpportunityVolunteeringType");

            migrationBuilder.DropTable(
                name: "VolunteeringOpportunities");

            migrationBuilder.DropTable(
                name: "VolunteeringTypes");

            migrationBuilder.DropTable(
                name: "Users");
        }
    }
}
