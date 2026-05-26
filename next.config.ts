import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  // 允許開發時從此 host 存取 dev resources（例如手機透過本機 IP 訪問）
  // 若需要額外 host，請加入陣列中
  allowedDevOrigins: ["192.168.220.77"],
};

export default nextConfig;
