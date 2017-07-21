(2017) New project was fork  MOTDstat https://bitbucket.org/hetii/motdstat

## MOTDs32 Custom MOTD by  🅴🆁🆁🅴🆄🆁32

<article><p data-source-line="2"><a href="https://gitlab.echosystem.fr/Erreur32/MOTDs32/commits/master"><img src="https://gitlab.echosystem.fr/Erreur32/MOTDs32/badges/master/coverage.svg" alt="coverage report"></a></p>
<p data-source-line="8">Project<a href="https://gitlab.echosystem.fr/Erreur32/MOTDs32">https://gitlab.echosystem.fr/Erreur32/MOTDs32</a></p>

<pre data-source-line="10"><code class="hljs">
,--.   ,--. ,-----. ,--------.,------.         ,----.  ,---.
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
    <a href="https://echosystem.fr/termrec/MOTDs32.html">View   terminal screen result (slow and buggy .p)</a>
  </li>
  <li>
    <a href="#explanation-of-the-report">Explanation of the report</a>
  </li>
  <li>
    <a href="#author">Author</a>
    original fork https://bitbucket.org/hetii/motdstat
Customized by     Ｅｒｒｅｕｒ３２
  </li>
</ul>
<p></p>
<h2 id="motds32-documentation" data-source-line="20"><a class="anchor" href="#motds32-documentation"><span class="octicon octicon-link">MOTDs32 Documentation:</span></a></h2>
<p data-source-line="23">Original project:
<a href="http://www.gelogic.net/">http://www.gelogic.net/</a></p>
<pre>
<p data-source-line="26">MOTDs32 is a fork of the excelent MOTDstat !</p>
<p data-source-line="28">Usage: generate dynamicaly the /etc/motd file with current information about system resources and usage</p>
<p data-source-line="30">Using crontab the script will periodically display status of system resources and services.</p>
<p data-source-line="32">The original message of the day is now stored in /etc/motd.orig file.</p>
<p data-source-line="34">Everytime you connect throught the SSH you will see some informations (customisable).</p>
</pre>
<p data-source-line="37"><a href="https://gitlab.echosystem.fr/Erreur32/MOTDs32/blob/master/README.md#sample-motd32-report">See  example</a></p>
<hr>
<h2 id="installation" data-source-line="44"><a class="anchor" href="#installation"><span class="octicon octicon-link">INSTALLATION:</span></a></h2>
<p data-source-line="46"><code class="hljs">git clone <a href="https://gitlab.echosystem.fr/Erreur32/MOTDs32.git">https://gitlab.echosystem.fr/Erreur32/MOTDs32.git</a></code></p>
<p data-source-line="48">type inside the directory:</p>
<pre data-source-line="50"><code class="hljs">./Install.sh
Answer: y (install the package needed)</code>
<code> 
If you want to check MANUALY,
try this command: /usr/bin/motds32</code>
or
<code>motd
</code></pre>
<pre data-source-line="50"><code class="hljs">motd
Usage: motds32 OPTIONS
    -g, --generate    Check system status and generate it to /etc/motd file
    -s, --status      Show limited content of MOTD file
    -v, --version     Display information about motds32 version and author
    -m, --MotD32      See the MOTD file
</code></pre>

You can see the result with :

<code>cat /etc/motd</code> 
<br>or
<code>usr/bin/motds32 -c</code>
<br>or
<code>motd -m</code><br><br>

You can set differents features in  /etc/motds32/motds32.conf

<br><br>
<h2 id="update" data-source-line="52"><a class="anchor" href="#update">UPDATE:</a></h2>
need to redownload the last version form gitlab, do the following:
<pre data-source-line="55"><code class="hljs">git clone https://gitlab.echosystem.fr/Erreur32/MOTDs32.git
cd MOTDs32
./uninstall.sh
git pull
./install.sh
</code></pre>


 
<hr>
<h2 id="sample-motd32-report" data-source-line="74"><a class="anchor" href="#sample-motd32-report"><span class="octicon octicon-link">Sample  MOTD32 report</span></a></h2>
<pre data-source-line="77"><code class="hljs">00:03:47 19/07  @echosystem .../Stats-tools/MOTDs32 (master)# /usr/bin/motds32 -c
 
--------------------------------------------------

 motd -m
Read motds32 file
        echosystem.fr  > status at 10:05 > 5min load is 0.82 on 8 cpu(s)

      Disk status        |      Memory status       |     Service status
partition      free  usg | Memory      used kB  [%] | service(s)        (count)
/              4,9G  74% | Memory:    59711808  90% | tcp/0.0.0.0:2222
/home          1,5T  12% | Swap:          3560   0% | tcp6/:::2222
                         | Buffers:    1271192      | tcp/0.0.0.0:25
                         | Cached:    51624824      | tcp6/:::25
                         |                          | tcp/127.0.0.1:8080
                         |                          | tcp6/:::80
                         |                          | tcp6/:::443
                         |                          | udp/37.187.162.229:123
                         |                          | udp/127.0.0.1:123
                         |                          | udp/0.0.0.0:123
                         |                          | udp6/fe80::ec4:7aff:fe0f:123
                         |                          | udp6/2001:41d0:d:2e5:::123
                         |                          | udp6/::1:123
             __                             __                      ___
.-----.----.|  |--.-----.-----.--.--.-----.|  |_.-----.--------.  .'  _|.----.
|  -__|  __||     |  _  |__ --|  |  |__ --||   _|  -__|        |__|   _||   _|
|_____|____||__|__|_____|_____|___  |_____||____|_____|__|__|__|__|__|  |__|
                              |_____|
/bin/bash : root

 10:05:39 up 66 days, 15:35,  2 users,  load average: 1,40, 0,79, 0,67
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
erreur32 pts/0    213.173.170.22   mar.15    2days  1.62s  0.26s sshd: erreur32 [priv]
erreur32 pts/1    2a01:e35:8aa3:87 08:57    4.00s  1.10s  0.01s sshd: erreur32 [priv]

Debian GNU/Linux 8.8 (jessie) (3.16.0-4-amd64).
Kernel Info:    Linux 3.16.0-4-amd64 x86_64

-----------     ---     ------------    ----------
System load :   1.40    IP Address:     37.187.162.229
Memory usage:   10.3%   System uptime:  66 days
Usage on /  :   74%     Swap usage:     0.0%
Local Users :   2       Processes:      282
-----------     ---     ------------    ----------

  vendredi 21 juillet 2017, 10:05:39 (UTC+0200)


  mercredi 19 juillet 2017, 00:05:44 (UTC+0200)</code></pre><h2 id="explanation-of-the-report" data-source-line="127"><a class="anchor" href="#explanation-of-the-report"><span class="octicon octicon-link">Explanation of the report</span></a></h2>
<pre data-source-line="129"><code class="hljs">Explanation of the report
-------------------------

   system hostname              report time        system load
         |                          |                   |
         |      NTP status          |                   |  Number of CPU(s)
         |         |                |                   |      |
         V         V                V                   V      V                  
    echosystem.fr+-+  > status at 00:03 > 5min load is 0.75 on 8 cpu(s)</code></pre>
    

View on terminal screen the resultat:    
<a class="anchor" href="https://echosystem.fr/termrec/MOTDs32.html">https://echosystem.fr/termrec/MOTDs32.html</a>

<h2 id="author" data-source-line="144"><a class="anchor" href="#author"><span class="octicon octicon-link"></span></a>Author</h2>
original project: https://bitbucket.org/hetii/motdstat.git
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