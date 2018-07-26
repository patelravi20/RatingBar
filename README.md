# RatingBar


<h2>Usages:-</h2>

**Step 1:- Assign RatingControl class to your stackview** 
<br>
<br>
<a href="https://github.com/patelravi20/RatingBar/blob/master/Screen%20Shot%202018-07-26%20at%203.50.17%20PM.png"><img src="https://github.com/patelravi20/RatingBar/blob/master/Screen%20Shot%202018-07-26%20at%203.50.17%20PM.png" title=""/></a>

**Step 2:- here you Can set button Image Size,Button Star Count and Also set your own Image**
<br>
<br>
<a href="https://github.com/patelravi20/RatingBar/blob/master/Screen%20Shot%202018-07-26%20at%203.54.54%20PM.png"><img src="https://github.com/patelravi20/RatingBar/blob/master/Screen%20Shot%202018-07-26%20at%203.54.54%20PM.png" title=""/></a>

<br>
<br>
<br>


**Step 3:- Write <u>RatingControllerDelegate</u> where you get ratingBar Action**
```
class ViewController: UIViewController,RatingControllerDelegate{
    func didSelected(rating: Int) {
        self.lblRatingInfo.isHidden = false
        switch rating {
        case 0:
            self.lblRatingInfo.text = ""
            break
        case 1:
            self.lblRatingInfo.text = "worst"
            break
        case 2:
            self.lblRatingInfo.text = "bad"
            break
        case 3:
            self.lblRatingInfo.text = "OK"
            break
        case 4:
            self.lblRatingInfo.text = "better"
            break
        case 5:
            self.lblRatingInfo.text = "best"
            break
        default:
            break
        }   
    }
```
<br>

**Step 4:- Output**
<br>
<a href="https://github.com/patelravi20/RatingBar/blob/master/Simulator%20Screen%20Shot%20-%20iPhone%208%20Plus%20-%202018-07-26%20at%2016.19.53.png"><img src="https://github.com/patelravi20/RatingBar/blob/master/Simulator%20Screen%20Shot%20-%20iPhone%208%20Plus%20-%202018-07-26%20at%2016.19.53.png" title=""/></a>
