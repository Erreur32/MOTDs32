<article><p data-source-line="2"><a href="https://gitlab.echosystem.fr/Erreur32/MOTDs32/commits/master"><img src="https://gitlab.echosystem.fr/Erreur32/MOTDs32/badges/master/coverage.svg" alt="coverage report"></a></p>
<p data-source-line="6">(2017) New project MOTDs32 by Erreur32</p>
<p data-source-line="8"><a href="https://gitlab.echosystem.fr/Erreur32/MOTDs32">https://gitlab.echosystem.fr/Erreur32/MOTDs32</a></p>
<pre data-source-line="10"><code class="hljs">,--.   ,--. ,-----. ,--------.,------.         ,----.  ,---.
|   `.'   |'  .-.  ''--.  .--'|  .-.  \  ,---. '.-.  |'.-.  \
|  |'.'|  ||  | |  |   |  |   |  |  \  :(  .-'   .' &lt;  .-' .'
|  |   |  |'  '-'  '   |  |   |  '--'  /.-'  `)/'-'  |/   '-.
`--'   `--' `-----'    `--'   `-------' `----' `----' '-----'

          |  +	Ｓｔａｔｓ３２   |</code></pre><p data-source-line="18">
</p><ul class="toc">
  <li>
    <a href="#motds32-documentation">MOTDs32 Documentation:</a>
  </li>
  <li>
    <a href="#installation">INSTALLATION:</a>
  </li>
  <li>
    <a href="#update">UPDATE:</a>
  </li>
  <li>
    <a href="#sample-motd32-report">Sample  MOTD32 report</a>
  </li>
  <li>
    <a href="#explanation-of-the-report">Explanation of the report</a>
  </li>
  <li>
    <a href="#author">Author</a>
  </li>
</ul>
<p></p>
<h2 id="motds32-documentation" data-source-line="20"><a class="anchor" href="#motds32-documentation"><span class="octicon octicon-link"></span></a>MOTDs32 Documentation:</h2>
<p data-source-line="23">Original project:
<a href="http://www.gelogic.net/">http://www.gelogic.net/</a></p>
<p data-source-line="26">MOTDs32 is a fork of the excelent MOTDstat !</p>
<p data-source-line="28">Usage: generate dynamicaly the /etc/motd file with current information about system resources and usage</p>
<p data-source-line="30">Using crontab the script will periodically display status of system resources and services.</p>
<p data-source-line="32">The original message of the day is now stored in /etc/motd.orig file.</p>
<p data-source-line="34">Everytime you connect throught the SSH you will see some informations (customisable).</p>
<p data-source-line="37"><a href="https://gitlab.echosystem.fr/Erreur32/MOTDs32/blob/master/README.md#sample-motd32-report">See  example</a></p>
<hr>
<h2 id="installation" data-source-line="44"><a class="anchor" href="#installation"><span class="octicon octicon-link"></span></a>INSTALLATION:</h2>
<p data-source-line="46"><code class="hljs">git clone <a href="https://gitlab.echosystem.fr/Erreur32/MOTDs32.git">https://gitlab.echosystem.fr/Erreur32/MOTDs32.git</a></code></p>
<p data-source-line="48">type inside the directory:</p>
<pre data-source-line="50"><code class="hljs">./Install.sh</code></pre>
<pre data-source-line="50"><code class="hljs">FINISH !!!</code></pre>
<code> 
If you want to check MANUALY,

try this command: /usr/bin/motds32
 

Full automated script.
</code>
<pre data-source-line="50"><code class="hljs">  
/usr/bin/motds32
Usage: motds32 OPTIONS
    -g, --generate    Check system status and generate it to /etc/motd file
    -s, --status      Show limited content of MOTD file
    -v, --version     Display information about motds32 version and author
    -c, --check  Check stats motd file
</code></pre>

You can see the result with : cat /etc/motd or usr/bin/motds32 -c

<h2 id="update" data-source-line="52"><a class="anchor" href="#update"><span class="octicon octicon-link"></span></a>UPDATE:</h2>
<pre data-source-line="55"><code class="hljs">cd /PATH/MOTDs32
git pull</code></pre>


 
<hr>
<h2 id="sample-motd32-report" data-source-line="74"><a class="anchor" href="#sample-motd32-report"><span class="octicon octicon-link"></span></a>Sample  MOTD32 report</h2>
<pre data-source-line="77"><code class="hljs">00:03:47 19/07  @echosystem .../Stats-tools/MOTDs32 (master)# /usr/bin/motds32 -c
 
--------------------------------------------------

motds32 check motd file
        echosystem.fr  &gt; status at 00:03 &gt; 5min load is 0.75 on 8 cpu(s)

      Disk status        |      Memory status       |     Service status
partition      free  usg | Memory      used kB  [%] | service(s)        (count)
/              5,9G  68% | Memory:    61431116  92% | tcp/0.0.0.0:2222
/home          1,5T  12% | Swap:          3500   0% | tcp6/:::2222
                         | Buffers:    1266580      | tcp/0.0.0.0:25
                         | Cached:    50682196      | tcp6/:::25
                         |                          | tcp/127.0.0.1:8080
                         |                          | tcp6/:::80
                         |                          | tcp6/:::443
                         |                          | udp/37.187.162.229:123
                         |                          | udp/127.0.0.1:123
                         |                          | udp/0.0.0.0:123
                         |                          | udp6/fe80::ec4:7aff:fe0f:123
                         |                          | udp6/2001:41d0:d:2e5:::123
                         |                          | udp6/::1:123

          _                         _                    __
  ___  ___| |__   ___  ___ _   _ ___| |_ ___ _ __ ___    / _|_ __
 / _ \/ __| '_ \ / _ \/ __| | | / __| __/ _ \ '_ ` _ \  | |_| '__|
|  __/ (__| | | | (_) \__ \ |_| \__ \ ||  __/ | | | | |_|  _| |
 \___|\___|_| |_|\___/|___/\__, |___/\__\___|_| |_| |_(_)_| |_|
                           |___/
/bin/bash ==&gt; root

 00:05:44 up 64 days,  5:35,  3 users,  load average: 1,18, 0,84, 0,70
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
erreur32 pts/0    213.173.170.22   15:43    6:51m  1.62s  0.03s sshd: erreur32 [priv]
erreur32 pts/1    2a01:e35:8aa3:87 18:35    1:06m  2.55s  0.02s sshd: erreur32 [priv]
erreur32 pts/2    2a01:e35:8aa3:87 18:44    2.00s  3.29s  0.02s sshd: erreur32 [priv]

Debian GNU/Linux 8.8 (jessie) (3.16.0-4-amd64).
Kernel Info:    Linux 3.16.0-4-amd64 x86_64

-----------     ---     ------------    ----------
System load :   1.18    IP Address:     37.187.162.229
Memory usage:   14.4%   System uptime:  64 days
Usage on /  :   68%     Swap usage:     0.0%
Local Users :   3       Processes:      286
-----------     ---     ------------    ----------

  mercredi 19 juillet 2017, 00:05:44 (UTC+0200)</code></pre><h2 id="explanation-of-the-report" data-source-line="127"><a class="anchor" href="#explanation-of-the-report"><span class="octicon octicon-link"></span></a>Explanation of the report</h2>
<pre data-source-line="129"><code class="hljs">Explanation of the report
-------------------------

   system hostname              report time        system load
         |                          |                   |
         |      NTP status          |                   |  Number of CPU(s)
         |         |                |                   |      |
         V         V                V                   V      V                  
hosting.gelogic.net*+ &gt; status at 19:15 &gt; 5min load is 1.06 on 4 cpu(s)</code></pre><h2 id="author" data-source-line="144"><a class="anchor" href="#author"><span class="octicon octicon-link"></span></a>Author</h2>
<div class="success" data-source-line="146">
<p>by 🅴🆁🆁🅴🆄🆁32</p>
</div>
<div class="warning" data-source-line="152">
<p>Hosted on</p>
</div>
<div class="info" data-source-line="158">
<p>🅴🅲🅷🔵🆂🆈🆂🆃🅴🅼</p>
</div>
</article>