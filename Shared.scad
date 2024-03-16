frontWidth = 250;
bodyBackThickness = 10;
bodyBackHeight = 175;
baseHolsterRadius = 25;
baseHolsterLipLength = 25;
topShelfVerticalOffset = 30;
topShelfDepth = 75;
topShelfThickness = 15;
topShelfHorizontalPadding = 0;
wingAngle = 30;
bodyWidth = frontWidth + 2 * tan(wingAngle) * topShelfDepth;
indentationDepth = 7;
mountHoleSpacing = 282.5;
mountHoleHorizontalPadding = (bodyWidth - mountHoleSpacing) / 2;
mountHoleVerticalPadding = topShelfVerticalOffset / 2;
mountHoleRadius = 2; // TODO: Find dimension for real screw
