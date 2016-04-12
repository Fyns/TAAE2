//
//  AERingBuffer.m
//  TAAESample
//
//  Created by 32BT on 12/04/16.
//  Copyright © 2016 A Tasty Pixel. All rights reserved.
//

#import "AERingBuffer.h"
#import <math.h>


////////////////////////////////////////////////////////////////////////////////

AERingBuffer AERingBufferBegin(size_t maxSampleCount)
{
	uint64_t shift = ceil(log2(maxSampleCount));
	uint64_t indexMask = (1<<shift)-1;
	float *samplePtr = calloc(indexMask+1, sizeof(float));
	
	return (AERingBuffer){ 0, indexMask, samplePtr };
}

////////////////////////////////////////////////////////////////////////////////

void AERingBufferEnd(AERingBuffer ringBuffer)
{
	if (ringBuffer.samplePtr != NULL)
	{ free(ringBuffer.samplePtr); }
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark
////////////////////////////////////////////////////////////////////////////////

void AERingBufferWriteSamples(AERingBuffer *ringBuffer, float *srcPtr, size_t count)
{
	for (;count!=0; count--)
	{ AERingBufferWriteSample(ringBuffer, *srcPtr++); }
}

////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////


