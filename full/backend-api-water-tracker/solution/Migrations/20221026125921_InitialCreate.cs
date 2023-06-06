using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace api.Migrations
{
    public partial class InitialCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Entries",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    DateTime = table.Column<DateTime>(type: "TEXT", nullable: false),
                    Consumption = table.Column<int>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Entries", x => x.Id);
                });

            migrationBuilder.InsertData(
                table: "Entries",
                columns: new[] { "Id", "Consumption", "DateTime" },
                values: new object[] { 1, 100, new DateTime(2022, 10, 1, 1, 0, 0, 0, DateTimeKind.Local) });

            migrationBuilder.InsertData(
                table: "Entries",
                columns: new[] { "Id", "Consumption", "DateTime" },
                values: new object[] { 2, 110, new DateTime(2022, 10, 1, 1, 10, 0, 0, DateTimeKind.Local) });

            migrationBuilder.InsertData(
                table: "Entries",
                columns: new[] { "Id", "Consumption", "DateTime" },
                values: new object[] { 3, 120, new DateTime(2022, 10, 1, 1, 20, 0, 0, DateTimeKind.Local) });

            migrationBuilder.InsertData(
                table: "Entries",
                columns: new[] { "Id", "Consumption", "DateTime" },
                values: new object[] { 4, 130, new DateTime(2022, 10, 1, 1, 30, 0, 0, DateTimeKind.Local) });

            migrationBuilder.InsertData(
                table: "Entries",
                columns: new[] { "Id", "Consumption", "DateTime" },
                values: new object[] { 5, 140, new DateTime(2022, 10, 1, 1, 40, 0, 0, DateTimeKind.Local) });

            migrationBuilder.InsertData(
                table: "Entries",
                columns: new[] { "Id", "Consumption", "DateTime" },
                values: new object[] { 6, 150, new DateTime(2022, 10, 1, 1, 50, 0, 0, DateTimeKind.Local) });

            migrationBuilder.InsertData(
                table: "Entries",
                columns: new[] { "Id", "Consumption", "DateTime" },
                values: new object[] { 7, 100, new DateTime(2022, 10, 1, 2, 0, 0, 0, DateTimeKind.Local) });

            migrationBuilder.InsertData(
                table: "Entries",
                columns: new[] { "Id", "Consumption", "DateTime" },
                values: new object[] { 8, 110, new DateTime(2022, 10, 1, 2, 10, 0, 0, DateTimeKind.Local) });

            migrationBuilder.InsertData(
                table: "Entries",
                columns: new[] { "Id", "Consumption", "DateTime" },
                values: new object[] { 9, 120, new DateTime(2022, 10, 1, 2, 20, 0, 0, DateTimeKind.Local) });

            migrationBuilder.InsertData(
                table: "Entries",
                columns: new[] { "Id", "Consumption", "DateTime" },
                values: new object[] { 10, 140, new DateTime(2022, 10, 1, 2, 40, 0, 0, DateTimeKind.Local) });

            migrationBuilder.InsertData(
                table: "Entries",
                columns: new[] { "Id", "Consumption", "DateTime" },
                values: new object[] { 11, 150, new DateTime(2022, 10, 1, 2, 50, 0, 0, DateTimeKind.Local) });

            migrationBuilder.InsertData(
                table: "Entries",
                columns: new[] { "Id", "Consumption", "DateTime" },
                values: new object[] { 12, 100, new DateTime(2022, 10, 1, 3, 0, 0, 0, DateTimeKind.Local) });

            migrationBuilder.InsertData(
                table: "Entries",
                columns: new[] { "Id", "Consumption", "DateTime" },
                values: new object[] { 13, 110, new DateTime(2022, 10, 1, 3, 10, 0, 0, DateTimeKind.Local) });

            migrationBuilder.InsertData(
                table: "Entries",
                columns: new[] { "Id", "Consumption", "DateTime" },
                values: new object[] { 14, 120, new DateTime(2022, 10, 1, 3, 20, 0, 0, DateTimeKind.Local) });

            migrationBuilder.InsertData(
                table: "Entries",
                columns: new[] { "Id", "Consumption", "DateTime" },
                values: new object[] { 15, 130, new DateTime(2022, 10, 1, 3, 30, 0, 0, DateTimeKind.Local) });

            migrationBuilder.InsertData(
                table: "Entries",
                columns: new[] { "Id", "Consumption", "DateTime" },
                values: new object[] { 16, 140, new DateTime(2022, 10, 1, 3, 40, 0, 0, DateTimeKind.Local) });

            migrationBuilder.InsertData(
                table: "Entries",
                columns: new[] { "Id", "Consumption", "DateTime" },
                values: new object[] { 17, 150, new DateTime(2022, 10, 1, 3, 50, 0, 0, DateTimeKind.Local) });

            migrationBuilder.InsertData(
                table: "Entries",
                columns: new[] { "Id", "Consumption", "DateTime" },
                values: new object[] { 18, 100, new DateTime(2022, 10, 1, 4, 0, 0, 0, DateTimeKind.Local) });

            migrationBuilder.InsertData(
                table: "Entries",
                columns: new[] { "Id", "Consumption", "DateTime" },
                values: new object[] { 19, 110, new DateTime(2022, 10, 1, 4, 10, 0, 0, DateTimeKind.Local) });

            migrationBuilder.InsertData(
                table: "Entries",
                columns: new[] { "Id", "Consumption", "DateTime" },
                values: new object[] { 20, 120, new DateTime(2022, 10, 1, 4, 20, 0, 0, DateTimeKind.Local) });

            migrationBuilder.InsertData(
                table: "Entries",
                columns: new[] { "Id", "Consumption", "DateTime" },
                values: new object[] { 21, 130, new DateTime(2022, 10, 1, 4, 30, 0, 0, DateTimeKind.Local) });

            migrationBuilder.InsertData(
                table: "Entries",
                columns: new[] { "Id", "Consumption", "DateTime" },
                values: new object[] { 22, 140, new DateTime(2022, 10, 1, 4, 40, 0, 0, DateTimeKind.Local) });

            migrationBuilder.InsertData(
                table: "Entries",
                columns: new[] { "Id", "Consumption", "DateTime" },
                values: new object[] { 23, 150, new DateTime(2022, 10, 1, 4, 50, 0, 0, DateTimeKind.Local) });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Entries");
        }
    }
}
