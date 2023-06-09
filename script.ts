import { PrismaClient } from "@prisma/client";
import { log } from "console";
const prisma = new PrismaClient();

async function main() {
  const user = await prisma.user.create({
    

  log(user);
}

main()
  .catch((err) => console.error(err))
  .finally(async () => await prisma.$disconnect());
