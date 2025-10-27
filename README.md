<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>SEED ALTAR — ALTAR (Token)</title>
  <meta name="description" content="SEED ALTAR — sacred token & NFT home. ALTAR token on Base. Connect wallet to view balances, swap, and verify ownership." />
  <meta name="theme-color" content="#0f0b18" />
  <!-- Ethers.js CDN -->
  <script src="https://cdn.jsdelivr.net/npm/ethers@6.9.0/dist/ethers.min.js"></script>
  <style>
    :root{
      --bg:#07050a;
      --card:#0f0b18;
      --muted:#9aa3b2;
      --accent:#8b5cf6;
      --glow: 0 0 28px rgba(139,92,246,0.12);
    }
    html,body{height:100%;margin:0;font-family:Inter,system-ui,Segoe UI,Roboto,"Helvetica Neue",Arial;}
    body{background:linear-gradient(180deg,#040305 0%,#07050a 100%);color:#e8e9ee;display:flex;align-items:center;justify-content:center;padding:28px;}
    .wrap{max-width:980px;width:100%;display:grid;grid-template-columns:320px 1fr;gap:22px;}
    .card{background:linear-gradient(180deg, rgba(255,255,255,0.02), rgba(255,255,255,0.01));border-radius:14px;padding:20px;box-shadow:var(--glow);border:1px solid rgba(255,255,255,0.03);}
    .left{display:flex;flex-direction:column;align-items:center;gap:12px}
    .logo{width:200px;height:200px;border-radius:50%;display:flex;align-items:center;justify-content:center;overflow:hidden;background:radial-gradient(circle at 30% 20%, rgba(139,92,246,0.18), transparent 30%);box-shadow:0 6px 30px rgba(139,92,246,0.12), inset 0 2px 10px rgba(255,255,255,0.02);}
    .logo img{width:100%;height:100%;object-fit:cover}
    h1{margin:0;font-size:20px;letter-spacing:2px;color:#fff;text-align:center}
    p.lead{margin:6px 0 0;color:var(--muted);text-align:center}
    .cta{display:flex;gap:8px;margin-top:12px}
    button{background:linear-gradient(90deg,var(--accent), #6d28d9);border:0;padding:10px 12px;border-radius:10px;color:white;font-weight:600;cursor:pointer}
    .small{font-size:13px;color:var(--muted)}
    .right{display:flex;flex-direction:column;gap:12px}
    .section-row{display:flex;flex-wrap:wrap;gap:10px;align-items:center}
    .token-card{display:flex;justify-content:space-between;align-items:center;padding:12px;border-radius:10px;background:rgba(255,255,255,0.01);border:1px solid rgba(255,255,255,0.03)}
    .token-info{display:flex;gap:12px;align-items:center}
    .dot{width:44px;height:44px;border-radius:10px;background:linear-gradient(90deg,#2b0639,#4b1a7d);display:flex;align-items:center;justify-content:center;font-weight:700}
    .meta{color:var(--muted);font-size:13px}
    .balance{font-weight:700}
    .links{display:flex;gap:8px;flex-wrap:wrap}
    a.link{background:rgba(255,255,255,0.03);padding:8px 10px;border-radius:8px;color:#fff;text-decoration:none;font-size:13px;border:1px solid rgba(255,255,255,0.02)}
    .footer{margin-top:18px;color:var(--muted);font-size:13px}
    .contact{margin-top:8px;color:var(--muted)}
    .note{margin-top:8px;color:#ffd6f9;background:linear-gradient(180deg,rgba(139,92,246,0.06),transparent);padding:10px;border-radius:8px;font-size:13px}
    @media (max-width:900px){.wrap{grid-template-columns:1fr;}.logo{width:160px;height:160px}}
  </style>
</head>
<body>
  <main class="wrap">
    <aside class="card left">
      <div class="logo" id="logoContainer">
        <!-- Replace logoUrl in script or swap with <img src="..."> -->
        <img id="brandLogo" alt="SEED ALTAR logo" src="" />
      </div>

      <h1>SEED ALTAR</h1>
      <p class="lead">A sacred token — ALTAR. Born from ancestry, ritual, and creative power. Connect wallet to verify & interact.</p>

      <div class="cta">
        <button id="connectBtn">Connect Wallet</button>
        <button id="refreshBtn" style="background:transparent;border:1px solid rgba(255,255,255,0.06)">Refresh</button>
      </div>

      <div class="note">
        <strong>Quick</strong>: Press <em>Connect Wallet</em> to verify ownership, show balances, and access swap links.
      </div>

      <div class="contact small">
        <div><strong>Website:</strong> seedaltar.com</div>
        <div><strong>Email:</strong> seedaltarinfo@gmail.com</div>
        <div style="margin-top:6px"><strong>Main token:</strong> ALTAR</div>
      </div>
    </aside>

    <section class="card right">
      <!-- token list -->
      <div class="section-row">
        <div style="flex:1">
          <div class="token-card">
            <div class="token-info">
              <div class="dot">ALT</div>
              <div>
                <div class="meta">ALTAR (Main token)</div>
                <div class="balance" id="balanceMain">—</div>
              </div>
            </div>
            <div class="links">
              <a class="link" id="scanMain" target="_blank">View on BaseScan</a>
              <a class="link" id="swapMain" target="_blank">Swap</a>
            </div>
          </div>
        </div>
      </div>

      <div class="section-row" style="margin-top:10px">
        <div style="flex:1">
          <div class="token-card">
            <div class="token-info">
              <div class="dot">NFT</div>
              <div>
                <div class="meta">NFT Contract</div>
                <div class="balance" id="balanceNft">—</div>
              </div>
            </div>
            <div class="links">
              <a class="link" id="scanNft" target="_blank">View on BaseScan</a>
            </div>
          </div>
        </div>
      </div>

      <div class="section-row" style="margin-top:10px">
        <div style="flex:1">
          <div class="token-card">
            <div class="token-info">
              <div class="dot">ALT2</div>
              <div>
                <div class="meta">Sub Token</div>
                <div class="balance" id="balanceSub">—</div>
              </div>
            </div>
            <div class="links">
              <a class="link" id="scanSub" target="_blank">View on BaseScan</a>
              <a class="link" id="swapSub" target="_blank">Swap</a>
            </div>
          </div>
        </div>
      </div>

      <div class="footer">
        <div>Owner wallet: <code id="ownerAddr">—</code></div>
        <div style="margin-top:8px;color:var(--muted)">BaseScan updates sometimes take time — verification and token info will appear as explorers refresh.</div>

        <div style="margin-top:12px">
          <strong>Helpful:</strong> After connecting you can:
          <ul style="margin:8px 0 0 18px;color:var(--muted)">
            <li>Verify ownership by signing a message (in wallet).</li>
            <li>Use the Swap link to open a DEX page for buying ALTAR (ensure enough base token for gas).</li>
            <li>Contact: seedaltarinfo@gmail.com</li>
          </ul>
        </div>
      </div>
    </section>
  </main>

<script>
/*
  Seed Altar Web Home - simple client-side wallet connect + token read
  Replace the addresses & logoUrl below with your final values.
*/
const logoUrl = "https://i.postimg.cc/your-logo.png"; // <-- replace with your hosted 512x512 logo link
document.getElementById('brandLogo').src = logoUrl;

// Your token contract addresses (provided by you)
const ADDR_MAIN = "0xd44f3249dcb95683a537b15beb6059daefd4f8b3";      // main token (ALTAR)
const ADDR_NFT  = "0x1254290214e593a502b97136bc9d100007f1fcdd";      // NFT contract
const ADDR_SUB  = "0x5bbb4f8a466f58ec9603a7aed5bc4632cf032029";      // sub coin (if any)

// Build quick BaseScan links (view token)
const baseScanToken = (addr) => `https://basescan.org/token/${addr}`;
const baseScanAddr  = (addr) => `https://basescan.org/address/${addr}`;

// Set links
document.getElementById('scanMain').href = baseScanToken(ADDR_MAIN);
document.getElementById('scanNft').href  = baseScanToken(ADDR_NFT);
document.getElementById('scanSub').href  = baseScanToken(ADDR_SUB);

// Simple swap links: open Uniswap (or your DEX) with token address prefilled (user must pick correct router for Base/Mainnet)
// NOTE: these are generic links — check which DEX & chain you want (Uniswap / Base support)
document.getElementById('swapMain').href = `https://app.uniswap.org/#/swap?outputCurrency=${ADDR_MAIN}`;
document.getElementById('swapSub').href  = `https://app.uniswap.org/#/swap?outputCurrency=${ADDR_SUB}`;

// Minimal ERC-20 ABI for balanceOf & decimals & symbol
const ERC20_ABI = [
  "function balanceOf(address owner) view returns (uint256)",
  "function decimals() view returns (uint8)",
  "function symbol() view returns (string)"
];

let provider, signer, userAddress;

// Connect wallet
const connectBtn = document.getElementById('connectBtn');
connectBtn.addEventListener('click', connectWallet);

async function connectWallet(){
  if (!window.ethereum) {
    alert("No Web3 wallet detected. Please install MetaMask or Rainbow.");
    return;
  }
  provider = new ethers.BrowserProvider(window.ethereum);
  try {
    await provider.send("eth_requestAccounts", []);
    signer = await provider.getSigner();
    userAddress = await signer.getAddress();
    document.getElementById('ownerAddr').innerText = userAddress;
    connectBtn.innerText = "Connected";
    await fetchBalances();
  } catch (err) {
    console.error(err);
    alert("Wallet connection cancelled or failed.");
  }
}

// Fetch token balances (safe fallback if not ERC-20)
async function fetchBalances(){
  try {
    // main token
    await readTokenBalance(ADDR_MAIN, 'balanceMain');
    await readTokenBalance(ADDR_SUB, 'balanceSub');
    // for NFT we only provide link; if it's ERC-20-like, attempt to read
    await readTokenBalance(ADDR_NFT, 'balanceNft', true);
  } catch(e){
    console.error("fetchBalances:", e);
  }
}

async function readTokenBalance(tokenAddr, elementId, optional=false){
  try {
    if (!provider) provider = new ethers.BrowserProvider(window.ethereum || window);
    const contract = new ethers.Contract(tokenAddr, ERC20_ABI, provider);
    // Try symbol & decimals
    let symbol = "TOKEN";
    try { symbol = await contract.symbol(); } catch(e){}
    let decimals = 18;
    try { decimals = await contract.decimals(); } catch(e){}
    let balance = "—";
    try {
      if (userAddress) {
        const raw = await contract.balanceOf(userAddress);
        const human = ethers.formatUnits(raw, decimals);
        balance = parseFloat(human).toLocaleString(undefined, {maximumFractionDigits:6});
      } else {
        balance = "Connect wallet to see balance";
      }
    } catch(e){
      if (optional) balance = "N/A for NFT";
      else balance = "Error reading";
    }
    document.getElementById(elementId).innerText = `${balance} ${symbol || ''}`;
  } catch (err) {
    console.error("readTokenBalance error", err);
    document.getElementById(elementId).innerText = "—";
  }
}

document.getElementById('refreshBtn').addEventListener('click', async ()=>{
  if (!userAddress) return alert("Please connect first");
  await fetchBalances();
});

/* Helpful note for you:
  - Replace logoUrl at top with this file's hosted link.
  - If you want a specific Order (Buy) DEX URL on Base chain, update the swap links.
  - To show project description, team, or socials: add HTML blocks and link to your domain & socials.
*/

</script>
</body>
</html><img width="1024" height="1024" alt="1000072725" src="https://github.com/user-attachments/assets/72f155b9-7d35-4c2b-a27d-1c6e39a928b6" />
