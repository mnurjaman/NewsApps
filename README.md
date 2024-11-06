<h1>NewsApps</h1>

<p>NewsApps is an iOS application designed to display the latest top business headlines in the United States. It integrates with the <strong>News API</strong> from <a href="https://newsapi.org/" target="_blank">newsapi.org</a> to fetch up-to-date news and provides users with an intuitive, easy-to-navigate interface.</p>

<h2>Features</h2>
<ul>
    <li><strong>Real-Time Business News</strong>: Displays the latest business headlines in the U.S. directly from trusted sources via the News API.</li>
    <li><strong>Article Summaries</strong>: Offers brief summaries within the app, allowing users to get the highlights at a glance.</li>
    <li><strong>In-App Safari Viewer</strong>: Utilizes <strong>SafariServices</strong> to open full articles in Safari without exiting the app.</li>
    <li><strong>Clean, Responsive Design</strong>: Ensures an optimal reading experience with a well-organized and user-friendly interface.</li>
</ul>

<h2>Technologies Used</h2>
<ul>
    <li><strong>UIKit</strong> for the main UI components.</li>
    <li><strong>SafariServices</strong> for seamless article viewing within Safari.</li>
    <li><strong>News API</strong> for fetching the latest news headlines.</li>
    <li><strong>URLSession</strong> for asynchronous data fetching.</li>
    <li><strong>GCD (Grand Central Dispatch)</strong> for smooth UI updates after data retrieval.</li>
</ul>

<h2>Installation</h2>
<ol>
    <li>Clone the repository:
        <pre><code>git clone https://github.com/username/NewsApps.git</code></pre>
    </li>
    <li>Navigate to the project directory:
        <pre><code>cd NewsApps</code></pre>
    </li>
    <li>Get an API Key from <a href="https://newsapi.org/" target="_blank">newsapi.org</a> and add it to the project:
        <ul>
            <li>Create a file named <code>APIKey.swift</code> with the following content:
                <pre><code>struct APIKey {
    static let key = "YOUR_NEWS_API_KEY"
}</code></pre>
            </li>
            <li>Replace <code>YOUR_NEWS_API_KEY</code> with your actual API key.</li>
        </ul>
    </li>
    <li>Build and run the app in Xcode.</li>
</ol>

<h2>Demo</h2>
<p><a href="https://github.com/user-attachments/assets/79b7bdaf-0716-4a0c-be85-b3d58b016d64" target="_blank">
    <img src="https://img.youtube.com/vi/WfN0qAbw3Bw/0.jpg" alt="Watch the demo" style="max-width:100%;">
</a></p>

<h2>Contributing</h2>
<p>We welcome contributions! Feel free to fork the repository, create a new branch, and submit a pull request for any improvements or new features.</p>
