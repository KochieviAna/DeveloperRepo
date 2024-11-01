First action that have been taken from my end was building the project and trying to replicate as many issues as possible. During runing the project, I've detected that the two initial errors have been poped up, therefore, I've started debuging with that.
________________________
**Bug 1**

"/Users/macbook/Desktop/DeveloperRepo/IMDB-Info-main/IMDB Info/Presenter/FeaturedCell/FeaturedCell.swift:24:40 Value of type 'GenreList' has no member 'genres'"
This bug is deisplayed because of pure sintax mistake in GenreList file, instead of:

genr changed to genres to match the API.
________________________
**Bug 2**

"/Users/macbook/Desktop/DeveloperRepo/IMDB-Info-main/IMDB Info/Presenter/FeaturedCell/FeaturedCell.swift:41:53 Binary operator '==' cannot be applied to operands of type 'Bool' and 'Int'"

I have changed the structure Genre in Genre file, instead of:

struct Genre: Decodable {
    var id: Bool
    var name: String
}

should have been:

struct Genre: Decodable {
    var id: Int
    var name: String
}
________________________
**Bug 3**

resume() was missing from GenreManager's function fetchGenreList in GenreManager file, after this was fixed by me appDelegatee showed following message:

Thread 1: "Could not load NIB in bundle: 'NSBundle </Users/macbook/Library/Developer/CoreSimulator/Devices/3E1C4EE5-9C07-419F-A8C2-339A77C6D3AD/data/Containers/Bundle/Application/6AD829B4-36AE-4296-A3F1-F97007DBFE52/IMDB Info.app> (loaded)' with name 'MovieCollectionVie'"

Therefore it was clear the in MovieCollectionView registration was done incirrectly, instead of:

tableView.register(UINib(nibName: "MovieCollectionVie", bundle: nil), forCellReuseIdentifier: "MovieCollectionView")

should have been:

tableView.register(UINib(nibName: "MovieCollectionVie", bundle: nil), forCellReuseIdentifier: "MovieCollectionView")
________________________
**Bug 4**
Code below was not needed at all in SearchViewController file, it returned 0 sections for SearchViewController collectionView.

func numberOfSections(in collectionView: UICollectionView) -> Int {
        if movies.count > 0 {
            return 1
        }
        return 0
    }

After I had deleted the code section heather was displayed.
Now I should figure out why cell MovieCollectionViewCell is not displayed on SearchViewController collectionView.
________________________
**Bug 5**
SearchViewController collectionView cell is displayed now, because I've added following code:

New Variable:
private let searchMovies = "https://api.themoviedb.org/3/movie/now_playing?api_key=b688d2e3d40e21d185f1dd90d122a568&language=en-US&page=1"

FetchMovieList code in viewDidload:
movieManager.fetchMovieList(with: searchMovies) { movielist in
            self.movies = movielist.results
            DispatchQueue.main.async {
                self.searchCollectionView.reloadData()
            }
________________________
**Bug 6**
Sections height had to be adjusted properly in NowInTheaters file, which has been done.
________________________
**Bug 7**
MovieCollectionView extension in MovieCollectionView file:

extension MovieCollectionView: SkeletonCollectionViewDataSource {}
Was missing UICollectionViewDelegateFlowLayout, therefore, until I added it the code:

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 170)
    }
Was useless.

Also added following codes in  override func awakeFromNib() in the same file as well:

let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            self.movieCollectionView.collectionViewLayout = layout
________________________
**Bug 8**
Skeleton was not displayed in SearchViewController file.
Added following codes:

searchCollectionView.showAnimatedGradientSkeleton()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.searchCollectionView.stopSkeletonAnimation()
            self.searchCollectionView.hideSkeleton()
        }
